# ChatPDF Ruby Gem

A Ruby gem for interacting with the ChatPDF API, allowing you to have conversations with your PDF documents.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chatpdf'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
gem install chatpdf
```

## Usage

## Creating The Config File

Config file which contains the initializer for Chatpdf can be created manually or by running the following command:

```ruby
rails g chatpdf:install
```

This will generate the following file:

```ruby
# config/initializers/chatpdf_initializer.rb
Chatpdf.config do |config|
  config.api_key = ENV['CHATPDF_API_KEY']
end
```

## Usage


### Uploading The PDF file

Files can be added in two ways as mentioned in the chatpdf api as well. 

#### Adding File via upload
```ruby
client = Chatpdf::Client.new

file_path = '/path/to/your/file'

client.add_pdf(file_path)
=>

{"sourceId"=>"src_XXXXXXXXXXXXXXXX"}
```
#### Adding File via URL 

```ruby
client = Chatpdf::Client.new

file_url = 'https://test.com/some/external/file.pdf'

client.add_pdf_via_url(file_url)
=>

{"sourceId"=>"src_XXXXXXXXXXXXXXXX"}
```

### Chat With PDF

#### Chat Message
Before you could chat with PDF, using the `chat` method available on `Chatpdf::Client` instance.

#### Create a Chat Message

```ruby
message = Chatpdf::Message.new('Your Question Here')

message.to_h
=>
{
  role: 'user',
  content: 'Your Question Here'
}
```

Once `Chatpdf::Message` is created you can now ask question as follows:

```ruby
client.chat(source_id, [message.to_h])
=>
{
  'content' => 'Answer to your question'
}
```

#### Chat with Reference

This just returns the page references from the provided PDF along with the response from the chatpdf.

```ruby
client.chat_with_reference(source_id, [message.to_h])
=>
{
  'content' => 'Answer to your question',
  'references' => [{ "pageNumber" => 11 }]
}
```

### Chat Stream
Chatpdf also provides answers in form of stream, with this gem you can use that as well.

```ruby
client.chat_stream(source_id, [message.to_h]) do |response_chunks|
  puts response_chunks
end
```

### Delete Source
The source can be deleted with `delete_source` method available on client

```ruby
client.delete_source([source_ids]) # array of source_ids to be deleted
=>
nil
```

### Extended Feature of Gem

If you want to use easily use the chatpdf gem, extended classes will help you achieve so.

### Creating a Chat Session

```ruby
file_path = '/path/to/file.pdf'

# OR

file_url = 'https://example.com/path/to/file.pdf'

session = Chatpdf::Session::Conversation.new(file_path: file_path)

# OR

session = Chatpdf::Session::Conversation.new(file_url: file_url)

# OR

session = Chatpdf::Session::Conversation.new(source_id: source_id_of_already_uploaded_file)
```
> IMPORTANT: source_id cannot be provided if File path or File Url is provided. This will result in an error `Chatpdf::InvalidSessionInitialization`


### Asking Questions

```ruby
session.ask('Your question here')
=> "Your answer here"
```

With Reference

```ruby
session.ask('Your question here', references: true)
=> "Your answer here"
```


### Accessing The Asked Questions
Good thing about session is that it stores the asked questions in the instance itself, at a later point while using sesion, if you want to access the questions you have asked. You can do

```ruby
session.questions.map(&:to_s)
=>
["Your question here"]
```

#### Accessing The Asked Question's Answers

```ruby
session.questions.map { |question| question.answer.to_s }
=>
["Your answer here"]
```

### Serialise Questions
```ruby
session.questions.map(&:serialise)
=>
[{:id=>"0185bb65-c150-41c5-81a1-5f7f0532d8f2",
  :question=>"Your Question Here",
  :answer=>
   {:id=>"e68c2463-88ed-4bcc-b3a8-00990d4c6cc8",
    :content=>"Your Answer here",
    :references=>[]}}]
```

### Serialise the Session

```ruby
session.serialise
=>
{:file_path=>"/Users/abhishekkanojia/Downloads/NAB-AGM.pdf",
 :url=>nil,
 :source_id=>"src_vSixL2t5LY4fNLF4iGZ8f",
 :questions=>
  [{:id=>"0185bb65-c150-41c5-81a1-5f7f0532d8f2",
    :question=>"Your Question Here",
    :answer=>
     {:id=>"e68c2463-88ed-4bcc-b3a8-00990d4c6cc8",
      :content=>
       "Your Answer Here",
      :references=>[]}}]}
```

## Error Handling

The gem includes several error classes:

- `Chatpdf::InvalidConfiguration`: Raised when API key is not set
- `Chatpdf::InvalidSessionInitialization`: Raised when conversation parameters are invalid

## Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).
