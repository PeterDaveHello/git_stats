module GitStats
  module StatsView
    module Charts
      class AuthorsCharts
        def initialize(authors)
          @authors = authors
        end

        def commits_sum_by_author_by_date
          Chart.new do |f|
            f.multi_date_chart(
                data: @authors.sort_by { |author| -author.commits.size }[0..5].map { |author| {name: author.email, data: author.commits_sum_by_date} },
                title: :lines_by_date.t,
                y_text: :lines.t
            )
          end
        end

        def lines_added_by_author_by_date
          Chart.new do |f|
            f.multi_date_chart(
                data: @authors.sort_by { |author| -author.lines_added }[0..5].map { |author| {name: author.email, data: author.lines_added_by_date} },
                title: :lines_by_date.t,
                y_text: :lines.t
            )
          end
        end

        def lines_deleted_by_author_by_date
          Chart.new do |f|
            f.multi_date_chart(
                data: @authors.sort_by { |author| -author.lines_deleted }[0..5].map { |author| {name: author.email, data: author.lines_deleted_by_date} },
                title: :lines_by_date.t,
                y_text: :lines.t
            )
          end
        end

      end
    end
  end
end
