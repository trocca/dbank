import Debug "mo:base/Debug";
import Time "mo:base/Time";	
// import Nat "mo:base/Nat";
import Float "mo:base/Float";

actor DBank{
  
  stable var currentValue : Float = 0;
  stable var startTime: Float = Float.fromInt(Time.now());

  public func deposit(amount : Float) : async Float {
    currentValue += amount;
    Debug.print("DBank actor, your balance: " # debug_show(currentValue));
    return currentValue;
  };

  public func compound() {
    let currentTime: Float = Float.fromInt(Time.now());
    let elapsedTime: Float = currentTime - startTime;
    let elapsesTimeInSec : Float = elapsedTime / 1_000_000_000.0;

    currentValue := currentValue * (1.01 ** elapsesTimeInSec);
    startTime := currentTime;
  };

  public func withdraw(amount : Float) : async Float {
    
    if (currentValue < amount) {
      Debug.print("DBank actor, insufficient balance");
      return currentValue;
    };

    currentValue -= amount;
    Debug.print("DBank actor, your balance: " # debug_show(currentValue));
    return currentValue;
    };
  
  public query func getBalance() : async Float {
    return currentValue;
  };


  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };


}
