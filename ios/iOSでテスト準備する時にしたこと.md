- ProjectのInfo -> Configurations -> Test TargetがNoneになってるのでPods.debugを設定してあげる
- Test TargetにもBridging Headerのパスを設定してあげる
- Test Target -> General -> Testing -> Host Applicationを選択する
- Podfileに
```ruby
target 'AnnyTests' do
    inherit! :search_paths
end
```
を追加する
- Bridging Headerのimport文を""で囲まず、<>で囲んだ形式に変更する
- Bridging Headerでimportしているライブラリなどを使ってる各ファイルにimport文を記入する
- test targetにもpodを書く
- `@testable import AnnyDevelopment`をかく