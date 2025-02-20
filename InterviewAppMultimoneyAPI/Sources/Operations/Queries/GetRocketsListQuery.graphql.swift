// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetRocketsListQuery: GraphQLQuery {
  public static let operationName: String = "GetRocketsList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetRocketsList($limit: Int, $offset: Int) { rockets(limit: $limit, offset: $offset) { __typename wikipedia type success_rate_pct name description diameter { __typename meters } } }"#
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
      .field("rockets", [Rocket?]?.self, arguments: [
        "limit": .variable("limit"),
        "offset": .variable("offset")
      ]),
    ] }

    public var rockets: [Rocket?]? { __data["rockets"] }

    /// Rocket
    ///
    /// Parent Type: `Rocket`
    public struct Rocket: InterviewAppMultimoneyAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.Rocket }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("wikipedia", String?.self),
        .field("type", String?.self),
        .field("success_rate_pct", Int?.self),
        .field("name", String?.self),
        .field("description", String?.self),
        .field("diameter", Diameter?.self),
      ] }

      public var wikipedia: String? { __data["wikipedia"] }
      public var type: String? { __data["type"] }
      public var success_rate_pct: Int? { __data["success_rate_pct"] }
      public var name: String? { __data["name"] }
      public var description: String? { __data["description"] }
      public var diameter: Diameter? { __data["diameter"] }

      /// Rocket.Diameter
      ///
      /// Parent Type: `Distance`
      public struct Diameter: InterviewAppMultimoneyAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.Distance }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("meters", Double?.self),
        ] }

        public var meters: Double? { __data["meters"] }
      }
    }
  }
}
