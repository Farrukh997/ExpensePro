import 'package:equatable/equatable.dart';

import 'failure.dart';

class ErrorObject extends Equatable {
  final String title;
  final String message;

  const ErrorObject({
    required this.title,
    required this.message,
  });

  @override
  List<Object?> get props => [title, message];

  static mapFailureToErrorObject(FailureEntity failure) {
    return failure.when(
      serverFailure: () => const ErrorObject(
        title: 'Error Code: INTERNAL_SERVER_FAILURE',
        message: 'It seems that the server is not reachable at the moment, try '
            'again later, should the issue persist please reach out to the '
            'developer at a@b.com',
      ),
      dataParsingFailure: () => const ErrorObject(
        title: 'Error Code: JSON_PARSING_FAILURE',
        message: 'It seems that the app needs to be updated to reflect the , '
            'changed server data structure, if no update is '
            'available on the store please reach out to the developer at a@b.com',
      ),
      noConnectionFailure: () => const ErrorObject(
        title: 'Error Code: NO_CONNECTIVITY',
        message: 'It seems that your device is not connected to the network, '
            'please check your internet connectivity or try again later.',
      ),
      formatFailure: () => const ErrorObject(
        title: 'Error Code: WRONG_FORMAT',
        message: 'It seems that the given URI is not correct.',
      ),
    );
  }
}
