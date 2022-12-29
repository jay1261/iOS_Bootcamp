
protocol CanFly{
    func fly()
}

class Bird {
    func layEggs(){
        print("새가 알 낳는다")
    }

}

class Eagle: Bird, CanFly{
    func soar(){
        print("독수리가 날아오름")
    }
    func fly() {
        print("독수리가 난다")
    }
}

class Penguin: Bird{
    func swin(){
        print("펭귄이 수영합니다")
    }
}

struct Airplane: CanFly{
    func fly() {
        print("비행기가 난다")
    }
}

let penguin = Penguin()


