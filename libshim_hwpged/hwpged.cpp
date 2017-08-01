extern "C" __LIBC_HIDDEN__ long __set_errno(int n) {
  errno = n;
  return -1;
}
