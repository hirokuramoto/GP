!! カーネル行列を計算 !!

subroutine kernel_mat(n, design, object, x, y, kmat)
  implicit none
  integer(4), intent(in) :: n
  integer(4), intent(in) :: design
  integer(4), intent(in) :: object
  real(8), intent(in)    :: x(n, design)
  real(8), intent(in)    :: y(n, object)
  real(8), intent(out)   :: kmat(n, n)
  real(8), parameter     :: tau = 4.49094037236823
  real(8), parameter     :: sigma = 1.71465703130554e-06
  real(8), parameter     :: eta = 0.902572144267483
  integer(4)  i, j, k       ! カウンタ
  integer(4)  row           ! 結果ファイルの行数カウンタ
  real(8) a(n, design)  ! 設計変数
  real(8) z(1, n)
  real(8) b(n, n)
  real(8) imat(n, n)    ! 単位行列

  ! 単位行列を作る
  imat = 0.0d0
  do i = 1, n
    imat(i, i) = 1.0d0
  end do

  ! 要素毎に2乗して2次元配列aに格納
  do j = 1, design
    do i = 1, n
      a(i, j) = x(i, j) * x(i, j)
    end do
  end do

  ! 行ごとの和でベクトルzを作る
  z(1, :) = sum(a, 2)

  ! repmat(z, N, 1) + repmat(z.T, 1, N)
  do j = 1, n
    do i = 1, n
      b(i, j) = z(1, i) + z(1, j)
    end do
  end do

  ! カーネル行列を計算
  kmat = b - 2 * matmul(x, transpose(x))
  do j = 1, n
    do i = 1, n
      kmat(i, j) = tau * exp(-sigma * kmat(i, j)) + eta * imat(i, j)
    end do
  end do

  !--------------------!
  !　行列を表示する定型文　!
  !--------------------!

  !write(*, *) 'matrix i'
  !do i = 1, n
  !  write(*, '(11e10.3)') (imat(i, j), j = 1, n)
  !end do

  !write(*, *) 'matrix z'
  !write(*, '(11e10.3)') z

  !write(*, *) 'matrix b'
  !do i = 1, n
  !  write(*, '(11e10.3)') (b(i, j), j = 1, n)
  !end do

  !write(*, *) 'matrix kmat'
  !do i = 1, n
  !  write(*, '(11e10.3)') (kmat(i, j), j = 1, n)
  !end do

  !write(*, *) 'matrix X'
  !do i = 1, n
  !  write(*, '(11e10.3)') (x(i, j), j = 1, design)
  !end do

  !write(*, *) 'matrix y'
  !do i = 1, n
  !  write(*, '(11e10.3)') (y(i, j), j = 1, object)
  !end do

  return

end subroutine kernel_mat
