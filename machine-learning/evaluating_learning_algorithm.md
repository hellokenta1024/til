# Bias vs Variance
- バイアス(under fitting)か分散(over fitting)のどちらか
- over fittingかunder fittingのどちらかということ

# Regularization and Bias/Variance
- large lambda -> High bias (underfit)
- small lambda -> High variance (overfit)
- ラムダが小さいときはオーバーディッティングの危険がある

# Learning curves
- アルゴリズムを改善したいときに使う
- mが少ないときはerrorを小さくできる
- high biasのときはトレーニングセットの数を増やしても意味がない
- High varianceのときはJcvとJtrainの間にギャップが有る

# Deciding What to do next
- Get more training examples -> fixes high variance
