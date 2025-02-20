// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetShipListQuery: GraphQLQuery {
  public static let operationName: String = "GetShipList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetShipList($limit: Int, $offset: Int) { ships(limit: $limit, offset: $offset) { __typename year_built type name image } }"#
    ))

  public var limit: GraphQLNullable<Int>
  public var offset: GraphQLNullable<Int>

  public init(
    limit: GraphQLNullable<Int>,
    offset: GraphQLNullable<Int>
  ) {
    self.limit = limit
    self.offset = offset
  }

  public var __variables: Variables? { [
    "limit": limit,
    "offset": offset
  ] }

  public struct Data: InterviewAppMultimoneyAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("ships", [Ship?]?.self, arguments: [
        "limit": .variable("limit"),
        "offset": .variable("offset")
      ]),
    ] }

    public var ships: [Ship?]? { __data["ships"] }

    /// Ship
    ///
    /// Parent Type: `Ship`
    public struct Ship: InterviewAppMultimoneyAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.Ship }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("year_built", Int?.self),
        .field("type", String?.self),
        .field("name", String?.self),
        .field("image", String?.self),
      ] }

      public var year_built: Int? { __data["year_built"] }
      public var type: String? { __data["type"] }
      public var name: String? { __data["name"] }
      public var image: String? { __data["image"] }
    }
  }
}
