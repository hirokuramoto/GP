!! 対数尤度を計算 !!

subroutine log_likelihood(n, design, object, x, y)
  implicit none
  integer(4), intent(in) :: n
  integer(4), intent(in) :: design
  integer(4), intent(in) :: object
  real(8), intent(out)   :: x(n, design)
  real(8), intent(out)   :: y(n, object)
  integer(4) i, j, k

  

  return
end subroutine log_likelihood
