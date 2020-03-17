program main

  implicit none
  integer, parameter :: design = 6
  integer, parameter :: object = 2
  integer, parameter :: n = 5
  real(8) x(n, design)  ! 設計変数
  real(8) y(n, object)  ! 目的関数
  real(8) kmat(n, n), kmat2(n, n)   ! カーネル行列
  real(8) det_k, inv_k(n, n)
  real(8) t1, t2        ! 時間計測用
  real(8) log_p(object)
  integer(4) i, j       ! カウンタ

  ! 計算時間の計測
  call cpu_time(t1)

  ! データの読み込み
  call datain(n, design, object, x, y)

  ! カーネル行列を計算
  call kernel_mat(n, design, object, x, y, kmat)
  ! カーネル行列を保存
  kmat2 = kmat

  ! カーネル行列の行列式（det_k）と逆行列（inv_k）を計算
  call matrix_calc(n, kmat, det_k, inv_k)

  ! 対数尤度を計算
  call log_like(n, design, object, x, y, det_k, inv_k, log_p)

  !write(*, *) 'matrix X'
  !do i = 1, n
  !  write(*, '(11f10.4)') (x(i, j), j = 1, design)
  !end do

  !write(*, *) 'matrix y'
  !do i = 1, n
  !  write(*, '(11f10.4)') (y(i, j), j = 1, object)
  !end do

  !write(*, *) 'matrix kmat2'
  !do i = 1, n
  !  write(*, '(11f10.4)') (kmat2(i, j), j = 1, n)
  !end do

  write(*, *) 'matrix det_k'
  write(*, '(11f10.4)') det_k

  !write(*, *) 'matrix inv_k'
  !do i = 1, n
  !  write(*, '(11f10.4)') (inv_k(i, j), j = 1, n)
  !end do

  write(*, *) 'matrix log_p'
  do i = 1, object
    write(*, '(11f10.4)') log_p(i)
  end do

  call cpu_time(t2)
  write(*, *) "cpu time =", t2 - t1
  stop

end program main
