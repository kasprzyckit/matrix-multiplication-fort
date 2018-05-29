module matrix_multiplcation        
contains

function dotp(first, second, N) result(product)

    implicit none
    real(kind= 8) :: first(:)
    real(kind= 8) :: second(:)
    real(kind= 8) :: product
    integer(kind= 4) :: N, I

    product = 0

    do I=1, N
        product = product + first(I) * second(I)
    enddo

end function

subroutine mm(first, second, multiply, status)
    implicit none
    real(kind= 8),intent(in):: first(:,:) ! pierwsza macierz
    real(kind= 8),intent(in):: second(: ,:) ! druga macierz
    real(kind= 8),intent(out):: multiply(:,:) ! macierz wynikowa
    integer(kind= 4),intent(out):: status ! kod błędu, 0 gdy OK
    integer(kind=4) :: I, J, N, M, shape1(2), shape2(2), shape3(2)

    shape1 = shape(first)
    shape2 = shape(second)
    shape3 = shape(multiply)

    ! if (shape1(2) .NE. shape2(1)) 
    ! if (shape3(1) .NE. shape1(1) .OR. shape3(2) .NE. shape2(2))

    N = shape1(1)
    M = shape2(2)

    do I=1,N
        do J=1,M
            multiply(I, J) = dotp(first(I, :), second(:, J), shape1(2))
        enddo
    enddo
    status = 0

end subroutine

end module matrix_multiplcation