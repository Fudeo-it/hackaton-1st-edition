abstract class GenericDTOMapper<T,K, V> {
  T fromDTO(V dto, K Function(dynamic) objectMapper);
}