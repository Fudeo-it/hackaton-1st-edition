abstract class DTOMapper<D, M> {
  M toModel(D dto);

  D toDataTransfertObject(M model);
}