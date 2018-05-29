program main

    use matrix_multiplcation, only : mm


    real(kind= 8), allocatable :: first(:, :), second(:, :), result(:, :)
    integer(kind=4) :: i, j, status, n, m, k

    n = 2
    m = 4
    k = 3

    allocate(first(n, k))
    allocate(second(k, m))
    allocate(result(n, m))

    do i=1,n
        do j=1,k
            first(i, j) = i*j + 1
        enddo
    enddo

    do i=1,k
        do j=1,m
            second(i, j) = i**j + 1
        enddo
    enddo

    call mm(first, second, result, status)

    write (*, *) first(2, :)
    write (*, *) ""
    write (*, *) second(:, 4)
    write (*, *) ""
    write (*, *) result(2,4)

end program main