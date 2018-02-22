#!/usr/bin/env ruby
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

require 'minitest/autorun'
require_relative '../../../lib/handlers/sender_handler'

# SenderHandler unit tests class
class UnitTestsSenderHandler < Minitest::Test

  def setup
    @broker_value = "127.0.0.4:5672"
    @address_value = "examples_queue"
    @log_msgs_value = "dict"
    @count_value = 7
    @msg_content_value = "hello"
    @msg_correlation_id = "corr-id-0123456789"
    @msg_group_id = "group-id-0987654321"

    @sender_handler_initialization = Handlers::SenderHandler.new(
      @broker_value,
      @address_value,
      @log_msgs_value,
      @count_value,
      @msg_content_value,
      @msg_correlation_id,
      @msg_group_id
    )
  end # setup

  def test_sender_handler_broker_argument_initialization
    assert_equal(@broker_value, @sender_handler_initialization.broker)
  end # test_sender_handler_broker_argument_initialization

  def test_sender_handler_address_argument_initialization
    assert_equal(@address_value, @sender_handler_initialization.address)
  end # test_sender_handler_address_argument_initialization

  def test_sender_handler_log_msgs_argument_initialization
    assert_equal(@log_msgs_value, @sender_handler_initialization.log_msgs)
  end # test_sender_handler_log_msgs_argument_initialization

  def test_sender_handler_count_argument_initialization
    assert_equal(@count_value, @sender_handler_initialization.count)
  end # test_sender_handler_count_argument_initialization

  def test_sender_handler_msg_content_argument_initialization
    assert_equal(
      @msg_content_value,
      @sender_handler_initialization.msg_content
    )
  end # test_sender_handler_msg_content_argument_initialization

  def test_sender_handler_msg_correlation_id_argument_initialization
    assert_equal(
      @msg_correlation_id,
      @sender_handler_initialization.msg_correlation_id
    )
  end # test_sender_handler_msg_correlation_id_argument_initialization

  def test_sender_handler_msg_group_id_argument_initialization
    assert_equal(
      @msg_group_id,
      @sender_handler_initialization.msg_group_id
    )
  end # test_sender_handler_msg_group_id_argument_initialization

end # class UnitTestsSenderHandler

# eof
