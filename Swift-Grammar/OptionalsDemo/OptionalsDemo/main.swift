
let myOptional : String?

myOptional = "Angela"

//let text: String = myOptional // error

// 1. Force Unwrapping  -- nil 값이 들어오면 런타임 오류가 난다
let text: String = myOptional!

// 2. Check for nil value
if myOptional != nil{
    let text2: String = myOptional!
}
else{
    print("myOptional was found to be nil")
}

// 3. Optional Binding
if let safeOptional = myOptional{
    let text3: String = safeOptional
    print(safeOptional)
}
else{
    print("Optional is nil")
}

// 4. Ni; coalescing operator
let text4: String = myOptional ?? "Default value"


// 5. optional chaining
struct OptionalStruct{
    var property: Int = 123
    func method(){
        print("Optional method")
    }
}

let optionalStruct: OptionalStruct?
optionalStruct = OptionalStruct()
optionalStruct?.method() //?? print("asdf")
