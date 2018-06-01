program main

    use mm, only : run_mm0, run_mm1, run_mm2, run_mm3, run_mmlib

    integer(kind=4) :: i, n, m, k, mode
    integer(kind=4) :: l, s
    character(len=10) :: buffer

    call get_command_argument(1, buffer, l, s)
    read(buffer,*) n

    call get_command_argument(2, buffer, l, s)
    read(buffer,*) m

    call get_command_argument(3, buffer, l, s)
    read(buffer,*) k

    call get_command_argument(4, buffer, l, s)
    read(buffer,*) mode

    do i=n, m, k
        select case (mode)
            case (0)
                call run_mm0(i)
            case (1)
                call run_mm1(i)
            case (2)
                call run_mm2(i)
            case (3)
                call run_mm3(i)
            case default
                call run_mmlib(i)
        end select
    enddo

end program main