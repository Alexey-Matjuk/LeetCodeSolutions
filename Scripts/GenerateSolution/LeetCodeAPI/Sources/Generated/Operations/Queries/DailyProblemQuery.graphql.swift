// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Generated {
  class DailyProblemQuery: GraphQLQuery {
    static let operationName: String = "DailyProblem"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query DailyProblem { activeDailyCodingChallengeQuestion { __typename link question { __typename questionFrontendId title titleSlug content difficulty exampleTestcases topicTags { __typename name slug translatedName } codeSnippets { __typename lang langSlug code } envInfo } } }"#
      ))

    public init() {}

    struct Data: Generated.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Generated.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("activeDailyCodingChallengeQuestion", ActiveDailyCodingChallengeQuestion.self),
      ] }

      var activeDailyCodingChallengeQuestion: ActiveDailyCodingChallengeQuestion { __data["activeDailyCodingChallengeQuestion"] }

      /// ActiveDailyCodingChallengeQuestion
      ///
      /// Parent Type: `DailyProblem`
      struct ActiveDailyCodingChallengeQuestion: Generated.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Generated.Objects.DailyProblem }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("link", String.self),
          .field("question", Question.self),
        ] }

        var link: String { __data["link"] }
        var question: Question { __data["question"] }

        /// ActiveDailyCodingChallengeQuestion.Question
        ///
        /// Parent Type: `Question`
        struct Question: Generated.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { Generated.Objects.Question }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("questionFrontendId", String.self),
            .field("title", String.self),
            .field("titleSlug", String.self),
            .field("content", String.self),
            .field("difficulty", String.self),
            .field("exampleTestcases", String.self),
            .field("topicTags", [TopicTag].self),
            .field("codeSnippets", [CodeSnippet].self),
            .field("envInfo", String.self),
          ] }

          var questionFrontendId: String { __data["questionFrontendId"] }
          var title: String { __data["title"] }
          var titleSlug: String { __data["titleSlug"] }
          var content: String { __data["content"] }
          var difficulty: String { __data["difficulty"] }
          var exampleTestcases: String { __data["exampleTestcases"] }
          var topicTags: [TopicTag] { __data["topicTags"] }
          var codeSnippets: [CodeSnippet] { __data["codeSnippets"] }
          var envInfo: String { __data["envInfo"] }

          /// ActiveDailyCodingChallengeQuestion.Question.TopicTag
          ///
          /// Parent Type: `TopicTag`
          struct TopicTag: Generated.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { Generated.Objects.TopicTag }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("slug", String.self),
              .field("translatedName", String?.self),
            ] }

            var name: String { __data["name"] }
            var slug: String { __data["slug"] }
            var translatedName: String? { __data["translatedName"] }
          }

          /// ActiveDailyCodingChallengeQuestion.Question.CodeSnippet
          ///
          /// Parent Type: `CodeSnippet`
          struct CodeSnippet: Generated.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { Generated.Objects.CodeSnippet }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("lang", String.self),
              .field("langSlug", GraphQLEnum<Generated.LangSlug>.self),
              .field("code", String.self),
            ] }

            var lang: String { __data["lang"] }
            var langSlug: GraphQLEnum<Generated.LangSlug> { __data["langSlug"] }
            var code: String { __data["code"] }
          }
        }
      }
    }
  }

}