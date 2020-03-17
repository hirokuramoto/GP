!! カーネル行列の行列式(det_k)と逆行列(inv_k)を計算 !!

subroutine matrix_calc(n, kmat, det_k, inv_k)
  implicit none
  integer(4), intent(in) :: n
  real(8), intent(in)    :: kmat(n, n)
  real(8), intent(out)   :: det_k
  real(8), intent(out)   :: inv_k(n, n)

  integer(4)             :: i, j, info, lwork
  real(8)                :: ipiv(1, n)
  real(8)                :: lwork0
  real(8), allocatable   :: work(:)

  ! LAPACKのルーチンを呼び出して行列をLU分解
  call DGETRF(n, n, kmat, n, ipiv, info)

  ! 行列式の値を計算
  det_k = 1.0d0
  do i = 1, n
    det_k = det_k * kmat(i, i)
  end do

  ! LU分解された行列の逆行列を求めるのに最適なワークスペースの大きさを求めます。
  call DGETRI(n, kmat, n, ipiv, lwork0, -1, info)

  ! ワークスペース用の配列を確保します。
  lwork = int(lwork0)
  allocate(work(1:lwork))

  ! GETRFでLU分解した結果を用いてもとの行列の逆行列を計算
  ! もとの行列 kmat の逆行列が kmat に格納される
  call DGETRI(n, kmat, n, ipiv, work, lwork, info)

  inv_k = kmat

  ! ワークスペース用の配列を解放
  deallocate(work)

end subroutine matrix_calc
