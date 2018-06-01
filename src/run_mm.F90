module mm
    contains
    subroutine run_mm0(N)
    use matrix_multiplication, only : mm0

    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    real :: start, finish
    integer(kind=4) :: i, j, status
    integer(kind=4), intent(in) :: N

    allocate(first(n, n))
    allocate(second(n, n))
    allocate(result(n, n))

    do i=1,N
        do j=1,N
            first(i, j) = i*j + 10
            second(i, j) = i**j + 1
        enddo
    enddo

    call cpu_time(start)
    call mm0(first, second, result, status)
    call cpu_time(finish)
    print '(i8, f10.4)',N, finish-start

    end subroutine

    subroutine run_mm1(N)
    use matrix_multiplication, only : mm1

    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    real :: start, finish
    integer(kind=4) :: i, j, status
    integer(kind=4), intent(in) :: N

    allocate(first(n, n))
    allocate(second(n, n))
    allocate(result(n, n))

    do i=1,N
        do j=1,N
            first(i, j) = i*j + 10
            second(i, j) = i**j + 1
        enddo
    enddo

    call cpu_time(start)
    call mm1(first, second, result, status)
    call cpu_time(finish)
    print '(i8, f10.4)',N, finish-start

    end subroutine

    subroutine run_mm2(N)
    use matrix_multiplication, only : mm2

    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    real :: start, finish
    integer(kind=4) :: i, j, status
    integer(kind=4), intent(in) :: N

    allocate(first(n, n))
    allocate(second(n, n))
    allocate(result(n, n))

    do i=1,N
        do j=1,N
            first(i, j) = i*j + 10
            second(i, j) = i**j + 1
        enddo
    enddo

    call cpu_time(start)
    call mm2(first, second, result, status)
    call cpu_time(finish)
    print '(i8, f10.4)',N, finish-start

    end subroutine

    subroutine run_mm3(N)
    use matrix_multiplication, only : mm3

    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    real :: start, finish
    integer(kind=4) :: i, j, status
    integer(kind=4), intent(in) :: N

    allocate(first(n, n))
    allocate(second(n, n))
    allocate(result(n, n))

    do i=1,N
        do j=1,N
            first(i, j) = i*j + 10
            second(i, j) = i**j + 1
        enddo
    enddo

    call cpu_time(start)
    call mm3(first, second, result, status)
    call cpu_time(finish)
    print '(i8, f10.4)',N, finish-start

    end subroutine

    subroutine run_mmlib(N)

    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    real :: start, finish
    integer(kind=4) :: i, j
    integer(kind=4), intent(in) :: N

    allocate(first(n, n))
    allocate(second(n, n))

    do i=1,N
        do j=1,N
            first(i, j) = i*j + 10
            second(i, j) = i**j + 1
        enddo
    enddo

    call cpu_time(start)
    result = MATMUL(first, second)
    call cpu_time(finish)
    print '(i8, f10.4)',N, finish-start

    end subroutine
end module