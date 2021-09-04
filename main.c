#include <time.h>
#include <stdio.h>
#include <omp.h>

#define LOOP (1000000000)
#define FMA_INS_NUM (32)

typedef void (*kernel_func_t)(int);

static double get_time(struct timespec *start, struct timespec *end) {
    return end->tv_sec - start->tv_sec + (end->tv_nsec - start->tv_nsec) * 1e-9;
}

static void test_kernel_func(kernel_func_t kernel_func, const int threads_num,
                                const long int inner_loop_num, const int ops_per_loop) {
    struct timespec start, end;
    double time_used = 0.0;
    int warmup_loop = 100;
    // warm up(pre heat)
    #pragma omp parallel for
    for (int i = 0; i < threads_num; i++) {
        kernel_func(warmup_loop);
    }
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    #pragma omp parallel for
    for (int i = 0; i < threads_num; i++) {
        kernel_func(inner_loop_num);
    }
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    time_used = get_time(&start, &end);
    printf("perf: %.6lf GFlops\r\n", 1.0 * threads_num * inner_loop_num * ops_per_loop * 1e-9 / time_used);
}

#ifdef __aarch64__
#ifdef __NEON__
    void kernel_neon_fp32(int);
#endif // __NEON__

#ifdef __SVE__
    void kernel_sve_fp32(int);
#endif // __SVE__
#endif // __aarch64__

int main() {
    int threads_num = omp_get_max_threads();
    int ops_per_loop;

#ifdef __aarch64__
#ifdef __NEON__
    printf("NEON fp32...\n");
    ops_per_loop = 2 * 4 * FMA_INS_NUM;
    test_kernel_func(kernel_neon_fp32, threads_num, LOOP, ops_per_loop);
#endif // __NEON__

#ifdef __SVE__
    printf("SVE fp32...\n");
    ops_per_loop = 2 * 16 * FMA_INS_NUM;
    test_kernel_func(kernel_sve_fp32, threads_num, LOOP, ops_per_loop);
#endif // __SVE__
#endif // __aarch64__

    return 0;
}
