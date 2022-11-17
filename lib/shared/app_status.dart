// ignore_for_file: public_member_api_docs, sort_constructors_first

// create a class to handle loading, error and success states based on the enums below
import 'package:cs_100/shared/spinner.dart';
import 'package:flutter/material.dart';

class AppStatus {
  final Status status;
  final String errorMessage;
  AppStatus(
      {required this.status,
      this.errorMessage =
          "Something happened, check your connection and try again"});

  Widget get state => status == Status.loading
      ? const Spinner()
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        );
}

enum Status { loading, failure }
