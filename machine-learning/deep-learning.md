## 深層学習とは
- 人間の脳のニューロンを模したニューラルネットワークを何層にも重ねて大規模にした機械学習の一手法
### 深層学習で出来ること
- 画像分類
- 正解データは基本的に人の手で作らなければならない。
- いかに少ないデータで学習するかという研究も活発
- 転移学習
  - ある問題を解くために学習したモデルを流用して別の問題を解くモデルを構築する手法の一種
- one-shot learning
  - 1つもしくは少数のサンプルのみで学習する機械学習の手法の一種
- 各種クラウドサービスの画像処理API
  - Cloud Vision API
  - Computer Vision API (Microsoft Azure)
  - Amazon Rekognition
  - Visual Recognition (IBM)
- 物体検出
  - Tensorflow Object Detection API
- セグメンテーション
  - ピクセル単位で物体を推定する
  - 重なった物体を区別できない
- 画像変換、画風変換
  - pix2pix
  - Cycle GAN
- 超解像
  - waifu2x
- 画像生成
  - DCGAN
- 文章分類
  - Google Smart Reply
- 対話文生成
- 翻訳、文章要約
- 音声認識
- 音声合成、生成
  - Project Magenta
  - 誰でも簡単に音楽の生成ができる

## 強化学習
- DQN
- Deep Q Network、深層学習と強化学習の一種のQ Learningを組み合わせた手法。
- 時系列データの予測、分類
- 異常検知

## Tensorflowの特徴
- 有向非巡回グラフ（DAG, Directed acyclic graph）
- テンソルはベクトルや行列を一般化した数学の概念
- テンソル同士の演算の結果もテンソルになるという性質がある
- Pythonでグラフの定義を行う
- CPUでもGPUでも同じコードを動かす事ができる
- Tensorflow liteという巨大なモデルを圧縮することができるプロジェクト
- deeplearn.js from Google -> ブラウザ上のjavascriptでtensorflowのモデルを高速に実行できる。デモなどの用途で注目されている
- Tensorflow serving -> モデルを気軽にAPIとして提供できる
- 分散処理をある程度簡単に記述することができる
- Tensor Boardによる可視化
  - 学習時の損失関数の経過 
  - 中間層の様子
  - 抽出した特徴量の埋込による歌詞化
  - 今何がおこっているのかを理解する助け
- 低レベルAPIから高レベルAPIまでカバーされている
- CoreAPI -> Layers -> Keras -> Estimator
- Google Cloud Machine Learning Engine

## Kerasとは
- 深層学習のライブラリもしくはAPI仕様のこと
- Theano
  - Python用数値計算ライブラリの1つ
- CNTK
  - Microsoftが開発した深層学習ライブラリ
- scikit-learn
  - Pythonの機械学習のライブラリ。深層学習を除く、機械学習やデータ分析においてほとんど標準に地位を築いている

## 深層学習ライブラリの動向
- Define and Run
  - 計算グラフを定義して、まとめて処理すること
- Define by run
  - グラフの定義と処理を同時に行うこと
  - Chainer開発陣が提唱、Preferred Networks
- Define by runのライブラリ
  - Chainer
    - 国産ライブラリ
    - Microsoftも支援
  - PyTorch
    - Facebookが中心
  - Cluon
- せっかく学習したモデルのパラメターを別のライブラリでも利用したい
- ONNX (open Neural network exchange)
  - モデルを表現するための共通フォーマット

