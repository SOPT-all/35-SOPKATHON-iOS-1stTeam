//
//  InputViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

class InputViewController: UIViewController {
    
    private lazy var customInputView = CustomInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .background
        customInputView.goToInvitationButton.addTarget(self, action: #selector(goToInvitationButtonTapped), for: .touchUpInside)
    }
    
    private func setUI() {
        view.addSubview(customInputView)
    }
    
    private func setLayout() {
        customInputView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @objc private func goToInvitationButtonTapped() {
        guard let code = customInputView.codeTextField.text, code.count == 6, Int(code) != nil else {
            customInputView.warningButton.isHidden = false
            return
        }
        guard let intCode = Int(code) else { return }
        
        let invitationCode = inviteCodeAPI(invitationCode: intCode)
        
        getQuestion(invitationCode: invitationCode) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let solveVC = SolveViewController()
                    solveVC.questions = data
                    guard let window = self.view.window else {
                        print("window is nil")
                        return
                    }
                    ViewControllerUtils.setRootViewController(window: window, viewController: solveVC, withAnimation: true)
                    self.customInputView.warningButton.isHidden = true
                case .failure(let error):
                    print("질문 조회 실패: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension InputViewController {
    func getQuestion(invitationCode: inviteCodeAPI, completion: @escaping(Result<[String], FTError>) -> Void) {
        let provider = Providers.questionProvider
        
        guard let invitationCode = Int(customInputView.codeTextField.text ?? "")
        else { return }
        
        provider.request(.getQuestionnaires(invitationCode: invitationCode)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let responseData = try response.map(BaseResponse<[String]>.self)
                    
                    if responseData.status == 200 {
                        if let data = responseData.data {
                            print("질문지를 성공적으로 불러왔습니다. 질문목록: \(data)")
                            completion(.success(data))
                        } else {
                            print("응답에서 질문 목록울 찾을 수 없습니다.")
                            completion(.failure(.networkFail))
                            self.customInputView.warningButton.isHidden = false
                        }
                    } else {
                        print("질문지 로딩 실패: \(responseData.message)")
                        completion(.failure(.networkFail))
                        self.customInputView.warningButton.isHidden = false
                    }
                } catch {
                    print("응답 디코딩 실패: \(error.localizedDescription)")
                    completion(.failure(.networkFail))
                    self.customInputView.warningButton.isHidden = false
                }
            case .failure(let error):
                print("서버 요청 실패: \(error.localizedDescription)")
                completion(.failure(.networkFail))
                self.customInputView.warningButton.isHidden = false
            }
        }
    }
}
