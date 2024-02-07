class RepositoryResponse<T> {
  final bool isSuccess;
  final T? data;
  final String message;

  RepositoryResponse({
    this.isSuccess = true,
    this.data,
    this.message = 'Success',
  });

  RepositoryResponse.failed({
    this.isSuccess = false,
    this.data,
    this.message = 'Something went wrong.',
  });
}
