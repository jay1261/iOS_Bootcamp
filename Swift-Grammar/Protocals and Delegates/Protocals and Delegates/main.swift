
protocol AdvancedLifeSupport{
    func performCPR()
}

class EmergencyCallHandler{
    //프로토콜을 데이터타입으로 받음
    var delegate: AdvancedLifeSupport?
    
    func asessSituation(){
        print("Can you tell me what happened")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
     
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Paramedic perform CPR")
    }
}

class Doctor : AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doctor perform CPR")
    }
    
    func useStehescope(){
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("Surgeon perform CPR")
    }
    
    func useElectricDrill(){
        print("whirr...")
    }
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
let doc = Doctor(handler: emilio)
let surg = Surgeon(handler: emilio)

emilio.asessSituation()
emilio.medicalEmergency()
