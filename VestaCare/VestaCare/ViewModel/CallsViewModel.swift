//
//  CallsViewModel.swift
//  VestaCare
//
//  Created by aman on 27/04/24.
//

protocol CallsService {
    func reloadData()
}

class CallsViewModel {
    private let manager = NetworkManager()
    
    var callsServiceDelegate: CallsService?
    
    var data: Output? = Output(response: Response(Call: [])) {
        didSet {
            self.callsServiceDelegate?.reloadData()
        }
    }
        
    func fetchData() {
        manager.getCallsData { [weak self] Output in
            self?.data = Output
        }
    }
    
    
}
