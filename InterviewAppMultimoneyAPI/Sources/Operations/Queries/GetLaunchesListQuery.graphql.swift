// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetLaunchesListQuery: GraphQLQuery {
  public static let operationName: String = "GetLaunchesList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetLaunchesList($offset: Int, $limit: Int) { launchesPast(offset: $offset, limit: $limit) { __typename mission_name launch_year launch_success details id links { __typename video_link } } }"#
    ))

  public var offset: GraphQLNullable<Int>
  public var limit: GraphQLNullable<Int>

  public init(
    offset: GraphQLNullable<Int>,
    limit: GraphQLNullable<Int>
  ) {
    self.offset = offset
    self.limit = limit
  }

  public var __variables: Variables? { [
    "offset": offset,
    "limit": limit
  ] }

  public struct Data: InterviewAppMultimoneyAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("launchesPast", [LaunchesPast?]?.self, arguments: [
        "offset": .variable("offset"),
        "limit": .variable("limit")
      ]),
    ] }

    public var launchesPast: [LaunchesPast?]? { __data["launchesPast"] }

    /// LaunchesPast
    ///
    /// Parent Type: `Launch`
    public struct LaunchesPast: InterviewAppMultimoneyAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.Launch }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mission_name", String?.self),
        .field("launch_year", String?.self),
        .field("launch_success", Bool?.self),
        .field("details", String?.self),
        .field("id", InterviewAppMultimoneyAPI.ID?.self),
        .field("links", Links?.self),
      ] }

      public var mission_name: String? { __data["mission_name"] }
      public var launch_year: String? { __data["launch_year"] }
      public var launch_success: Bool? { __data["launch_success"] }
      public var details: String? { __data["details"] }
      public var id: InterviewAppMultimoneyAPI.ID? { __data["id"] }
      public var links: Links? { __data["links"] }

      /// LaunchesPast.Links
      ///
      /// Parent Type: `LaunchLinks`
      public struct Links: InterviewAppMultimoneyAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { InterviewAppMultimoneyAPI.Objects.LaunchLinks }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("video_link", String?.self),
        ] }

        public var video_link: String? { __data["video_link"] }
      }
    }
  }
}
