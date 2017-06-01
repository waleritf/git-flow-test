module Overcommit::Hook::CommitMsg
  class CommitPrefix < Base
    def run
      error_lines = []
      warning_lines = []

      prefix = config['prefix']
      commit_regexp = Regexp.new("^\\[#{prefix}-\\d+\\] .*$")
      commit_msg = commit_message_lines.join(' ')

      if !!commit_regexp.match(commit_msg)
        :pass
      else
        :fail
      end
    end
  end
end
