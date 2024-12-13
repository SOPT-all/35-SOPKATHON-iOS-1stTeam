//
//  QuestionContentView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

import RxSwift
import RxCocoa

class QuestionContentView: UIView {
    
    let headerView: UIView
    let questionStackView: UIStackView = UIStackView()
    let footerButton: UIButton = UIButton()
    
    var questionData : [String] = ["나는 오늘 솝커톤을 했다 !", "나는 빵을 좋아한다", "나는 젤리를 좋아한다"] {
        didSet {
            updateQuestions()
        }
    }
    
    let behaviorlelay: BehaviorRelay = BehaviorRelay(value: false)
    
    var invitedCode: Int = 0
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private var questionType: QuestionType
    
    init(questionType: QuestionType) {
        self.questionType = questionType
        self.headerView = questionType.headerView
        
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
        setBind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(headerView,
                         questionStackView,
                         footerButton)
        
    }
    
    func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(224)
        }
        
        questionStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(224)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(476)
        }
        
        footerButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(46)
            $0.horizontalEdges.equalToSuperview().inset(26)
            $0.height.equalTo(52)
        }
        
    }
    
    
    func setStyle() {
        self.backgroundColor = .background
        
        questionStackView.do {
            for i in 1...3 {
                let questionView = CustomQuestionView(questionType: questionType)
                questionView.questionTextLabel.text = questionData[i-1]
                $0.addArrangedSubview(questionView)
            }
            $0.setStackView(spacing: 13)
        }
        
        footerButton.do {
            $0.makeOrangeButton(title: questionType.footerButtonTitle)
        }
    }
    
    func updateQuestions() {
        questionStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        questionStackView.do {
            for i in 1...3 {
                let questionView = CustomQuestionView(questionType: questionType)
                questionView.questionTextLabel.text = questionData[i-1]
                $0.addArrangedSubview(questionView)
            }
            $0.setStackView(spacing: 13)
        }
    }
    
    private func setBind() {
        footerButton.rx.tap.subscribe { [weak self] _ in
            self?.prepareAndSendData()
        }.disposed(by: disposeBag)
    }

    
}
extension CustomQuestionView {
    func getQuestionData() -> Question? {
        guard let subject = questionTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !subject.isEmpty else {
            return nil // 질문 텍스트가 비어 있는 경우 nil 반환
        }
        let answer = trueButton.isSelected // trueButton이 선택되었는지 여부로 답변 결정
        return Question(subject: subject, answer: answer)
    }
}

extension QuestionContentView {
    func prepareAndSendData() {
        // Step 1: `selectedBackgroundIndex` 가져오기
        guard let askHeaderView = headerView as? AskHeaderView else {
            print("HeaderView가 AskHeaderView가 아닙니다.")
            return
        }
        
        let theme = askHeaderView.selectedBackgroundIndex
        
        // Step 2: `questionStackView`에서 질문 데이터 추출
        let questions = questionStackView.arrangedSubviews
            .compactMap { $0 as? CustomQuestionView }
            .compactMap { $0.getQuestionData() }
        
        guard !questions.isEmpty else {
            print("질문 데이터가 비어 있습니다.")
            return
        }
        
        // Step 3: 서버로 보낼 데이터 생성
        let questionDatas = Questionnaires(theme: theme, questions: questions)
        
        print("‼️‼️‼️‼️\(questionDatas)")
        
        self.makeQuestion(questions: questionDatas)
    }
    
    func makeQuestion(questions: Questionnaires) {
        let provider = Providers.questionProvider

        let parameters: [String: Any] = [
            "theme": questions.theme,
            "questions": questions.questions.map {
                ["subject": $0.subject, "answer": $0.answer]
            }
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("🔍 서버로 보낼 JSON: \(jsonString)")
            }
        } catch {
            print("JSON 직렬화 실패: \(error)")
        }
        
        provider.request(.postQuestionnaire(theme: questions.theme, questions: questions.questions)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let responseData = try response.map(BaseResponse<Int>.self)
                    
                    if responseData.status == 201 {
                        if let invitationCode = responseData.data {
                            print("질문지가 성공적으로 생성되었습니다. 초대 코드: \(invitationCode)")
                            
                            self.invitedCode = invitationCode
                            // ResultViewController로 이동
                            self.pushToResultViewController()
                        } else {
                            print("응답에서 초대 코드를 찾을 수 없습니다.")
                        }
                    } else {
                        print("질문지 생성 실패: \(responseData.message)")
                    }
                } catch {
                    print("응답 디코딩 실패: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("서버 요청 실패: \(error.localizedDescription)")
            }
        }
    }
    
    private func pushToResultViewController() {
        let resultViewController = UINavigationController(
            rootViewController: ResultViewController(invitationCode: invitedCode)
        )
        
        // UIViewController를 찾습니다.
        guard let viewController = self.findViewController() else {
            print("UIViewController를 찾을 수 없습니다.")
            return
        }
        
        // 뷰 계층의 UIWindow로 전환
        if let window = viewController.view.window {
            ViewControllerUtils.setRootViewController(window: window, viewController: resultViewController, withAnimation: true)
        } else {
            print("UIWindow를 찾을 수 없습니다.")
        }
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            nextResponder = responder.next
        }
        return nil
    }
}
