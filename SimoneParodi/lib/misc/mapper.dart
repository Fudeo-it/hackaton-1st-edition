abstract class DTOMapper<D, M> {
  M toModel(D dto);
  D toTransfertObject(M model);
}
