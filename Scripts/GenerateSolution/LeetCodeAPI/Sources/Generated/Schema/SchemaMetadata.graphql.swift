// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol Generated_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Generated.SchemaMetadata {}

protocol Generated_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Generated.SchemaMetadata {}

protocol Generated_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Generated.SchemaMetadata {}

protocol Generated_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Generated.SchemaMetadata {}

extension Generated {
  typealias SelectionSet = Generated_SelectionSet

  typealias InlineFragment = Generated_InlineFragment

  typealias MutableSelectionSet = Generated_MutableSelectionSet

  typealias MutableInlineFragment = Generated_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "CodeSnippet": return Generated.Objects.CodeSnippet
      case "DailyProblem": return Generated.Objects.DailyProblem
      case "Query": return Generated.Objects.Query
      case "Question": return Generated.Objects.Question
      case "TopicTag": return Generated.Objects.TopicTag
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}