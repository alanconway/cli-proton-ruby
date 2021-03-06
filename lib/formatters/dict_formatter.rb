#--
# Copyright 2017 Red Hat Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#++

require_relative 'basic_formatter'

module Formatters

  # Formatter of message into dictionary format
  class DictFormatter < Formatters::BasicFormatter

    # Initialization of dictionary formatter
    # ==== Dictionary formatter arguments
    # message:: message to format
    def initialize(message)
      super(message)
    end # initialize(message)

    # Format message as dictionary
    # ==== Returns
    # message formatted as dictionary
    def get_as_dictionary()
      dict_to_return = "" \
      + "'redelivered': #{format_value(
        @message.delivery_count == 0 ? false : true
      )}, "\
      + "'reply_to': #{format_value(@message.reply_to)}, "\
      + "'subject': #{format_value(@message.subject)}, "\
      + "'content_type': #{format_value(@message.content_type)}, "\
      + "'id': #{format_value(@message.id)}, "\
      + "'group_id': #{format_value(@message.group_id)}, "\
      + "'user_id': #{format_value(@message.user_id)}, "\
      + "'correlation_id': #{format_value(@message.correlation_id)}, "\
      + "'priority': #{format_value(@message.priority)}, "\
      + "'durable': #{format_value(@message.durable)}, "\
      + "'ttl': #{format_value(@message.ttl)}, "\
      + "'properties': #{format_value(@message.properties)}, "\
      + "'content': #{format_value(@message.body)}"
      return "{#{dict_to_return}}"
    end # get_as_dictionary()

    # Prints message formatted as dictionary to stdout
    def print()
      # Print formatted message to stdout
      puts get_as_dictionary()
    end # print()

  end # class DictFormatter

end # module Formatters

# eof
