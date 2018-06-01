program main

    use matrix_multiplication, only : mm0, mm1, mm2, mm3


    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    real :: start, finish
    integer(kind=4) :: i, j, status, n, m, k, ichunk
    integer(kind=4) :: l, s
    character(len=10) :: buffer

    call get_command_argument(1, buffer, l, s)
    read(buffer,*) N

    call get_command_argument(1, buffer, l, s)
    read(buffer,*) ichunk

    m = max(n - 10, 1)
    k = max(n*2/3, 1)

    allocate(first(n, k))
    allocate(second(k, m))
    allocate(result(n, m))

    do i=1,n
        do j=1,k
            first(i, j) = i*j + 10
        enddo
    enddo

    do i=1,k
        do j=1,m
            second(i, j) = i**j + 1
        enddo
    enddo

    do i=20, 300, 40

        call cpu_time(start)
        call mm3(first, second, result, status)
        call cpu_time(finish)
        write (*, *) i
        print '("Time mm2 = ",f6.3," seconds.")',finish-start

        ! call cpu_time(start)
        ! call mm3(first, second, result, status, i)
        ! call cpu_time(finish)
        ! write (*, *) i
        ! print '("Time mm3 = ",f6.3," seconds.")',finish-start

    enddo

    ! write (*, *) 
    ! first(2, :)
    ! write (*, *) ""
    ! write (*, *) second(:, 4)
    ! write (*, *) ""
    ! write (*, *) result(2,4)
    ! write (*, *) ""

    ! call cpu_time(start)
    ! call mm0(first, second, result, status)
    ! call cpu_time(finish)

    ! print '("Time mm0 = ",f6.3," seconds.")',finish-start

    ! call cpu_time(start)
    ! call mm1(first, second, result, status)
    ! call cpu_time(finish)

    ! print '("Time mm1 = ",f6.3," seconds.")',finish-start


end program main