## 発表候補

- Advaces 

## 発表内容

- 自己紹介
- UIViewImplicitlyAnimationg
- UIViewAnimating(protocol)
- UIViewPropertyAnimatorについて
- fraction~~ gestureについて
- UICubicTimingParametersについて
- UISpringTimingParametersについて
- Transitionでも使える

## UIViewAnimating

 アニメーションフローを制御するメソッドやプロパティを定義している

### Methods

- startAnimation()
- pauseAnimation()
- stopAnimation(Bool)
  - `true`を渡すと、そのまま`inactive`に遷移する
- finishAnimation(at: UIViewAnimatingPosition)
  - `stopAnimation(false)`の後に呼ばないと落ちる
  - 呼ぶことは必須ではない

### Properties

- fractionComplete: CGFloat
  - アニメーション完了までのパーセンテージ
  - 0.0 - 1.0
- isReversed: Bool
  - このプロパティを変えることによってアニメーションの方向を変えられる
- state: UIViewAnimatingState
  - active
  - inactive
  - stopped
- isRunning: Bool
  - 取得のみ

### Constants

- UIViewAnimatingState
  - active
  - inactive
  - stopped
- UIViewAnimatingPosition
  - end
  - start
  - current

## UIViewImplicitlyAnimating

### Methods

- addAnimations(() -> Void)
- addAnimations(() -> Void, delayFactor: CGFloat)
  - animationを追加する
  - 元のdurationに対して何割のところで始めるか
  - delayFactor 0.0 - 1.0
- addCompletion((UIViewAnimatingPosition) -> Void)
  - animationが止まった時のpositionが渡される
- continueAnimation(withTimingParameters: UITimingCurveProvider?, durationFactor: CGFloat)
  - pauseしているanimationに対して値を変更する

## UIViewPropertyAnimator

- 動的にアニメーションを変更できる

## Initializer

- init(duration: TimeInterval, curve: UIViewAnimationCurve, animations: (() -> Void)? = nil)
- init(duration: TimeInterval, controlPoint1: CGPoint, controlPoint2: CGPoint, animations: () -> Void)
  - 3次ベジェ関数
- init(duration: TimeInterval, dampingRatio: CGFloat, animations: (() -> Void)? = nil)
- init(duration: TimeInterval, timingParameters: UITimingCurveProvider)