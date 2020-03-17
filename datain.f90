!! データファイルの読み込みと前処理 !!

subroutine datain(n, design, object, x, y)
  implicit none
  integer(4), intent(in) :: n
  integer(4), intent(in) :: design
  integer(4), intent(in) :: object
  real(8), intent(out)   :: x(n, design)
  real(8), intent(out)   :: y(n, object)
  integer(4) i, j, k

  ! 結果ファイルの読み込み
  open(10, file='result.csv', status='old') ! status='old'で存在しているファイルを表す
  read(10, '()')  ! ヘッダ行読み飛ばし

  do i = 1, n
    read(10, *) (x(i, j),j = 1, design), (y(i, k), k = 1, object)
  end do

  close(10)

  return
end subroutine datain
