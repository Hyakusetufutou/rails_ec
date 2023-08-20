# frozen_string_literal: true

require_relative 'promotion_code_generator'

namespace :promotion_code do
  desc 'generate promotion code and register db'
  task generate: :environment do
    10.times do
      # プロモーションコードは一意な値にしたいので、一意な値でないものが生成された場合はプロモーションコードの生成を再度行う
      retry_count = 0
      begin
        code = PromotionCodeGenerator.generate_code(7)
        # 端数になるのが嫌なので、10の位で四捨五入する
        reduced_rate = PromotionCodeGenerator.reduced_rate(min: 100, max: 1000).round(-1)

        promotion_code = PromotionCode.new(code: code, reduced_rate: reduced_rate)
        promotion_code.save!
      rescue => e
        # 無限にループすると嫌なので、リトライ回数を100回に制限
        retry_count += 1
        if retry_count <= 100
          retry
        else
          puts 'プロモーションコードの生成に失敗しました'
          return 
        end
      end
    end
  end
end
