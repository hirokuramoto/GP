'''カーネル行列を計算'''

import numpy as np
import numpy.matlib
import pandas as pd
import time

t1 = time.time()

# データのインポート
csv = pd.read_csv('result.csv', header = 0, dtype = np.float32) # index（＝行名）はheader行の次の行を0として付与してくれる
data = csv.to_numpy()

# データの行数を取得
#n = data.shape[0]
n = 1000

# 設計変数と目的関数に分ける
design_mat = data[:, 0:6].T
object_mat = data[:, 6: ]

# 要素毎に2乗して列ごとに足す
z_arr = np.sum(np.square(design_mat), axis=0) # axis=0で列ごとの和
z = z_arr.reshape([1, n])

k = np.matlib.repmat(z.T, 1, n) + np.matlib.repmat(z, n, 1) - 2*design_mat.T @ design_mat

tau = 0.1
sigma = 0.4
eta = 0.2

gauss_k = tau * np.exp(-sigma * k) + eta*np.identity(n)
#np.savetxt("kernel_matrix.csv", X=gauss_k, delimiter=",")

t2 = time.time()
elapsed_time = t2 - t1
print(elapsed_time)
