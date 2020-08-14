class WithErrorFormBuilder < ActionView::Helpers::FormBuilder
  # エラーメッセージオブジェクトが格納されていたらエラーエッセージを表示するli要素を含んだ、ulを作成する
  def pick_errors(attribute)
    return nil if @object.nil? || (messages = @object.errors.messages[attribute]).nil?

    lis = messages.collect do |message|
      %(<li class="error__message">#{@object.errors.full_message(attribute, message)}</li>)
    end.join

    %(<ul class="error">#{lis}</ul>).html_safe
  end

  # 既存のフォールビルダーに対し、エラーメッセージの有無により、通常通りのヘルパーメソッドが、pick_errorsの呼び出しを加えたメソッドにする 
  def text_field(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def email_field(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def password_field(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def telephone_field(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def date_select(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def collection_select(attribute, select, key, value, options = {}, include = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def fields_for(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def number_field(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def text_area(attribute, options = {})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

end

