program main

  implicit none
  real(8) t1, t2        ! 時間計測用

  call cpu_time(t1)

  ! 評価関数
  call kernel_mat

  call cpu_time(t2)
  write(*, *) "cpu time =", t2 - t1
  stop

end program main
