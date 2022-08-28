---
date: 2022-08-28 12:00
tags: article, swift
---
# Protocol 'SomeProtocol' can only be used as a generic constraint because it has Self or associated type requirements

以下のようなコードを書いた際に、❌の箇所で発生するコンパイルエラーです。  
なぜAssociated Typeがあるとプロパティとして宣言できないのでしょうか？

```swift
protocol MyProtocol {
    associatedtype Value
    
    func doSomething(_ value: Value)
}

class MyClass {
    let instance: MyProtocol // ❌
}
```


## ProtocolがAssociated Typeを持たない場合

この場合は、問題なくコンパイルが成功します。

```swift
protocol MyProtocol {
    
    func doSomething()
}

class MyClass {
    let instance: MyProtocol
}
```

## ProtocolがAssociated Typeを持つ場合

以下のように、MyClassからMyProtocolのメソッドを呼び出すコードを追記してみました。  
このとき🦊には、MyProtocolのValue型の値が渡されるはずですが、この時点でValue型が確定できないため、コンパイルエラーが発生します。

```swift
protocol MyProtocol {
    associatedtype Value
    
    func doSomething(_ value: Value)
}

class MyClass {
    let instance: MyProtocol

    func myFunc() {
        instance.doSomething(🦊)
    }
}
```