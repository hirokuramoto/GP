program main

  implicit none
  integer, parameter :: design = 6
  integer, parameter :: object = 2
  integer, parameter :: n = 1000
  real(8) x(n, design)  ! 設計変数
  real(8) y(n, object)  ! 目的関数
  real(8) kmat(n, n)    ! カーネル行列
  real(8) t1, t2        ! 時間計測用
  integer(4) i, j       ! カウンタ

  ! 計算時間の計測
  call cpu_time(t1)

  ! データの読み込み
  call datain(n, design, object, x, y)



  ! カーネル行列を計算
  call kernel_mat(n, design, object, x, y, kmat)

  ! 対数尤度を計算

  !write(*, *) 'matrix kmat'
  !do i = 1, n
  !  write(*, '(11e10.3)') (kmat(i, j), j = 1, n)
  !end do

  call cpu_time(t2)
  write(*, *) "cpu time =", t2 - t1
  stop

end program main
