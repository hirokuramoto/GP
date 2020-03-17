!! 対数尤度を計算 !!

subroutine log_like(n, design, object, x, y, det_k, inv_k, log_p)
  implicit none
  integer(4), intent(in) :: n
  integer(4), intent(in) :: design
  integer(4), intent(in) :: object
  real(8), intent(in)    :: x(n, design)
  real(8), intent(in)    :: y(n, object)
  real(8), intent(in)    :: det_k
  real(8), intent(in)    :: inv_k(n, n)
  real(8), intent(out)   :: log_p(object)

  integer(4) :: i, j, k
  real(8)    :: temp(object, object)

  !log_p = dot_product(y1, y1)
  temp = matmul(matmul(transpose(y), inv_k), y)

  do i = 1, object
    log_p(i) = -log(det_k) - temp(i, i)
  end do

  return
end subroutine log_like
