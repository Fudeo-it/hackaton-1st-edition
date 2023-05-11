import 'package:dartz/dartz.dart';
import 'package:job_app/core/data/models/rich_text_model.dart';
import 'package:job_app/core/domain/entities/rich_text_entity.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';

import '../../../features/aziende/domain/entities/annuncio_azienda.dart';

typedef AnnuncioAziendaList = List<AnnuncioAzienda>;
typedef AnnuncioFreelancerList = List<AnnuncioFreelancers>;
typedef ListaPreferiti = List<Preferito>;
typedef AnnuncioList = List<Either<AnnuncioAzienda, AnnuncioFreelancers>>;
typedef Annuncio = Either<AnnuncioAzienda, AnnuncioFreelancers>;

typedef RichTextList = List<RichTextTextEntity>;
typedef RichTextModelList = List<RichTextModel>;
