// Mocks generated by Mockito 5.4.0 from annotations
// in offertelavoroflutter_app/test/bloc/freelance_list_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i13;

import 'package:logger/logger.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:offertelavoroflutter_app/models/filters.dart' as _i8;
import 'package:offertelavoroflutter_app/models/job.dart' as _i10;
import 'package:offertelavoroflutter_app/models/job_freelance.dart' as _i11;
import 'package:offertelavoroflutter_app/models/sorts.dart' as _i9;
import 'package:offertelavoroflutter_app/repositories/job_repository.dart'
    as _i12;
import 'package:offertelavoroflutter_app/repositories/mapper/filters_mapper.dart'
    as _i4;
import 'package:offertelavoroflutter_app/repositories/mapper/freelance_mapper.dart'
    as _i6;
import 'package:offertelavoroflutter_app/repositories/mapper/job_mapper.dart'
    as _i3;
import 'package:offertelavoroflutter_app/repositories/mapper/sorts_mapper.dart'
    as _i5;
import 'package:offertelavoroflutter_app/services/network/job_service.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeJobService_0 extends _i1.SmartFake implements _i2.JobService {
  _FakeJobService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJobMapper_1 extends _i1.SmartFake implements _i3.JobMapper {
  _FakeJobMapper_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFiltersMapper_2 extends _i1.SmartFake implements _i4.FiltersMapper {
  _FakeFiltersMapper_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSortsMapper_3 extends _i1.SmartFake implements _i5.SortsMapper {
  _FakeSortsMapper_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFreelanceMapper_4 extends _i1.SmartFake
    implements _i6.FreelanceMapper {
  _FakeFreelanceMapper_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLogger_5 extends _i1.SmartFake implements _i7.Logger {
  _FakeLogger_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFilters_6 extends _i1.SmartFake implements _i8.Filters {
  _FakeFilters_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSorts_7 extends _i1.SmartFake implements _i9.Sorts {
  _FakeSorts_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJob_8 extends _i1.SmartFake implements _i10.Job {
  _FakeJob_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJobFreelance_9 extends _i1.SmartFake implements _i11.JobFreelance {
  _FakeJobFreelance_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [JobRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockJobRepository extends _i1.Mock implements _i12.JobRepository {
  MockJobRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.JobService get jobService => (super.noSuchMethod(
        Invocation.getter(#jobService),
        returnValue: _FakeJobService_0(
          this,
          Invocation.getter(#jobService),
        ),
      ) as _i2.JobService);
  @override
  _i3.JobMapper get jobMapper => (super.noSuchMethod(
        Invocation.getter(#jobMapper),
        returnValue: _FakeJobMapper_1(
          this,
          Invocation.getter(#jobMapper),
        ),
      ) as _i3.JobMapper);
  @override
  _i4.FiltersMapper get filtersMapper => (super.noSuchMethod(
        Invocation.getter(#filtersMapper),
        returnValue: _FakeFiltersMapper_2(
          this,
          Invocation.getter(#filtersMapper),
        ),
      ) as _i4.FiltersMapper);
  @override
  _i5.SortsMapper get sortsMapper => (super.noSuchMethod(
        Invocation.getter(#sortsMapper),
        returnValue: _FakeSortsMapper_3(
          this,
          Invocation.getter(#sortsMapper),
        ),
      ) as _i5.SortsMapper);
  @override
  _i6.FreelanceMapper get freelanceMapper => (super.noSuchMethod(
        Invocation.getter(#freelanceMapper),
        returnValue: _FakeFreelanceMapper_4(
          this,
          Invocation.getter(#freelanceMapper),
        ),
      ) as _i6.FreelanceMapper);
  @override
  _i7.Logger get logger => (super.noSuchMethod(
        Invocation.getter(#logger),
        returnValue: _FakeLogger_5(
          this,
          Invocation.getter(#logger),
        ),
      ) as _i7.Logger);
  @override
  bool get hasMoreJob => (super.noSuchMethod(
        Invocation.getter(#hasMoreJob),
        returnValue: false,
      ) as bool);
  @override
  bool get hasMoreFreelance => (super.noSuchMethod(
        Invocation.getter(#hasMoreFreelance),
        returnValue: false,
      ) as bool);
  @override
  _i8.Filters get filterJob => (super.noSuchMethod(
        Invocation.getter(#filterJob),
        returnValue: _FakeFilters_6(
          this,
          Invocation.getter(#filterJob),
        ),
      ) as _i8.Filters);
  @override
  _i9.Sorts get sortsJob => (super.noSuchMethod(
        Invocation.getter(#sortsJob),
        returnValue: _FakeSorts_7(
          this,
          Invocation.getter(#sortsJob),
        ),
      ) as _i9.Sorts);
  @override
  _i8.Filters get filterFreelance => (super.noSuchMethod(
        Invocation.getter(#filterFreelance),
        returnValue: _FakeFilters_6(
          this,
          Invocation.getter(#filterFreelance),
        ),
      ) as _i8.Filters);
  @override
  _i9.Sorts get sortsFreelance => (super.noSuchMethod(
        Invocation.getter(#sortsFreelance),
        returnValue: _FakeSorts_7(
          this,
          Invocation.getter(#sortsFreelance),
        ),
      ) as _i9.Sorts);
  @override
  _i13.Future<List<_i10.Job>> get fetchAnotherJobs => (super.noSuchMethod(
        Invocation.getter(#fetchAnotherJobs),
        returnValue: _i13.Future<List<_i10.Job>>.value(<_i10.Job>[]),
      ) as _i13.Future<List<_i10.Job>>);
  @override
  _i13.Future<List<_i11.JobFreelance>> get fetchAnotherFreelance =>
      (super.noSuchMethod(
        Invocation.getter(#fetchAnotherFreelance),
        returnValue:
            _i13.Future<List<_i11.JobFreelance>>.value(<_i11.JobFreelance>[]),
      ) as _i13.Future<List<_i11.JobFreelance>>);
  @override
  _i13.Future<List<_i10.Job>> firstListJobs({
    _i8.Filters? filters,
    _i9.Sorts? sorts,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #firstListJobs,
          [],
          {
            #filters: filters,
            #sorts: sorts,
          },
        ),
        returnValue: _i13.Future<List<_i10.Job>>.value(<_i10.Job>[]),
      ) as _i13.Future<List<_i10.Job>>);
  @override
  _i13.Future<List<_i11.JobFreelance>> firstListFreelance({
    _i8.Filters? filters,
    _i9.Sorts? sorts,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #firstListFreelance,
          [],
          {
            #filters: filters,
            #sorts: sorts,
          },
        ),
        returnValue:
            _i13.Future<List<_i11.JobFreelance>>.value(<_i11.JobFreelance>[]),
      ) as _i13.Future<List<_i11.JobFreelance>>);
  @override
  _i13.Future<_i10.Job> jobByID(String? id) => (super.noSuchMethod(
        Invocation.method(
          #jobByID,
          [id],
        ),
        returnValue: _i13.Future<_i10.Job>.value(_FakeJob_8(
          this,
          Invocation.method(
            #jobByID,
            [id],
          ),
        )),
      ) as _i13.Future<_i10.Job>);
  @override
  _i13.Future<_i11.JobFreelance> freelanceByID(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #freelanceByID,
          [id],
        ),
        returnValue: _i13.Future<_i11.JobFreelance>.value(_FakeJobFreelance_9(
          this,
          Invocation.method(
            #freelanceByID,
            [id],
          ),
        )),
      ) as _i13.Future<_i11.JobFreelance>);
}