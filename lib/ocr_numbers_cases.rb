class OcrNumbersCase < ExerciseCase
  def workload
    if raises_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    %Q(OcrNumbers.convert(#{(input.join("\n")).inspect}))
  end
end

OcrNumbersCases = proc do |data|
  JSON.parse(data)['cases'].flat_map {|section| section['cases'] }.
    map.with_index {|test, index| OcrNumbersCase.new(test.merge('index' => index)) }
end