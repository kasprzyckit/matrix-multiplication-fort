module matrix_multiplication        
contains

subroutine mm0(first, second, multiply, status)
    implicit none
    real(kind= 8),intent(in):: first(:,:)
    real(kind= 8),intent(in):: second(: ,:)
    real(kind= 8),intent(out):: multiply(:,:)
    integer(kind= 4),intent(out):: status
    integer(kind=4) :: i, j, k, shape1(2), shape2(2), shape3(2)

    shape1 = shape(first)
    shape2 = shape(second)
    shape3 = shape(multiply)

    if (shape1(2) .NE. shape2(1)) then
        status = 1
        return
    endif
    if (shape3(1) .NE. shape1(1) .OR. shape3(2) .NE. shape2(2)) then
        status = 2
        return
    endif

    multiply = 0

    do i=1,shape1(1)
        do j=1,shape2(2)
            do k=1,shape1(2)
                multiply(i, j) = multiply(i, j) + first(i, k) * second(k, j)
            enddo
        enddo
    enddo
    status = 0

end subroutine

subroutine mm1(first, second, multiply, status)
    implicit none
    real(kind= 8),intent(in):: first(:,:)
    real(kind= 8),intent(in):: second(: ,:)
    real(kind= 8),intent(out):: multiply(:,:)
    integer(kind= 4),intent(out):: status
    integer(kind=4) :: i, j, shape1(2), shape2(2), shape3(2)

    shape1 = shape(first)
    shape2 = shape(second)
    shape3 = shape(multiply)

    if (shape1(2) .NE. shape2(1)) then
        status = 1
        return
    endif
    if (shape3(1) .NE. shape1(1) .OR. shape3(2) .NE. shape2(2)) then
        status = 2
        return
    endif


    do i=1,shape1(1)
        do j=1,shape2(2)
            multiply(i, j) = dot_product(first(i,:), second(:,j))
        enddo
    enddo
    status = 0

end subroutine

subroutine mm2(first, second, multiply, status)
    implicit none
    real(kind= 8),intent(in):: first(:,:)
    real(kind= 8),intent(in):: second(: ,:)
    real(kind= 8),intent(out):: multiply(:,:)
    integer(kind= 4),intent(out):: status
    integer(kind=4) :: i, j, k, jj, kk, shape1(2), shape2(2), shape3(2), ichunk

    shape1 = shape(first)
    shape2 = shape(second)
    shape3 = shape(multiply)

    if (shape1(2) .NE. shape2(1)) then
        status = 1
        return
    endif
    if (shape3(1) .NE. shape1(1) .OR. shape3(2) .NE. shape2(2)) then
        status = 2
        return
    endif

    ichunk = 180

    multiply = 0

    do jj = 1, shape2(2), ichunk
        do kk = 1, shape1(2), ichunk
            do j = jj, min(jj + ichunk - 1, shape2(2))
                do k = kk, min(kk + ichunk - 1, shape1(2))
                    do i = 1,shape1(1)
                        multiply(i, j) = multiply(i, j) + first(i, k) * second(k, j)
                    end do
                end do
            end do
        end do
    end do
    status = 0

end subroutine

subroutine mm3(first, second, multiply, status)
    implicit none
    real(kind= 8),intent(in):: first(:,:)
    real(kind= 8),intent(in):: second(: ,:)
    real(kind= 8),intent(out):: multiply(:,:)
    integer(kind= 4),intent(out):: status
    integer(kind=4) :: jj, ii, i, j, shape1(2), shape2(2), shape3(2), ichunk

    shape1 = shape(first)
    shape2 = shape(second)
    shape3 = shape(multiply)

    if (shape1(2) .NE. shape2(1)) then
        status = 1
        return
    endif
    if (shape3(1) .NE. shape1(1) .OR. shape3(2) .NE. shape2(2)) then
        status = 2
        return
    endif

    ichunk = 180

    do jj = 1, shape2(2), ichunk
        do ii = 1, shape1(1), ichunk
            do j = jj, min(jj + ichunk - 1, shape2(2))
                do i = ii, min(ii + ichunk - 1, shape1(1))
                    multiply(i, j) =  dot_product(first(i,:), second(:,j))
                end do
            end do
        enddo
    end do
    status = 0

end subroutine

end module matrix_multiplication