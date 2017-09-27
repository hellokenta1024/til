## 1対1のForm
```rb
f.collection_select :prefecture_id, Prefecture.all, :id, :name
```

`collection_select`はDBから取ってきた値でselectしたい時使うrailsの機能

## render_template matcher

https://relishapp.com/rspec/rspec-rails/docs/matchers/render-template-matcher

ex)
```rb
describe "GET #index" do
  subject { get :index }

  it "renders the index template" do
    expect(subject).to render_template(:index)
    expect(subject).to render_template("index")
    expect(subject).to render_template("gadgets/index")
  end

  it "does not render a different template" do
    expect(subject).to_not render_template("gadgets/show")
  end
end
```
## i18n

localしてくれるgem

## 組み合わせに対するValidation
```rb
validates :user_id, :uniqueness => {:scope => :article_id}
```

## 正規表現
https://docs.ruby-lang.org/ja/latest/doc/spec=2fregexp.html）

## rake taskに引数

http://qiita.com/nao58/items/aa50514d97f05eb8d128

```rb
task :register_holiday, ['date_string', 'excluding_company_ids_string'] => :environment do |task, args|
  #copy table
  ActiveRecord::Base.connection.execute('create table delivary_dates_copy like delivary_dates;')
  ActiveRecord::Base.connection.execute('insert into delivary_dates_copy select * from delivary_dates;')

  Company.all.each { |company|
    date = args[:date_string].to_date
    excluding_company_ids = args[:excluding_company_ids_string].split(' ').map { |id| id.to_i }
    next if excluding_company_ids.include?(company.id)
    DelivaryDate.find_or_create_by(company_id: company.id, not_delivary_date: date)
    p "create : #{company.id}"
  }
end
```
```sh
bundle exec rake 'companies:holiday[2017-8-11,68 85 90]'
```

## rails内でSQL叩く
```rb
ActiveRecord::Base.connection.execute('my_sql')
```
