include 'marshal.pyx'
from libc.stdint cimport int32_t
from cassandra.bytesio cimport BytesIOReader


cdef inline char *get_buf(BytesIOReader reader, Py_ssize_t *size_out):
    """
    Get a pointer into the buffer provided by BytesIOReader for the
    next data item in the stream of values.
    """
    raw_val_size = read_int(reader)
    size_out[0] = raw_val_size
    if raw_val_size < 0:
        return NULL
    else:
        return reader.read(raw_val_size)


cdef inline int32_t read_int(BytesIOReader reader):
    return int32_unpack(reader.read(4))
