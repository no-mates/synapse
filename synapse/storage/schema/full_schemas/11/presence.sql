/* Copyright 2014, 2015 OpenMarket Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
CREATE TABLE IF NOT EXISTS presence(
  user_id TEXT NOT NULL,
  state VARCHAR(20),
  status_msg TEXT,
  mtime BIGINT -- miliseconds since last state change
);

-- For each of /my/ users which possibly-remote users are allowed to see their
-- presence state
CREATE TABLE IF NOT EXISTS presence_allow_inbound(
  observed_user_id TEXT NOT NULL,
  observer_user_id TEXT NOT NULL -- a UserID,
);

-- For each of /my/ users (watcher), which possibly-remote users are they
-- watching?
CREATE TABLE IF NOT EXISTS presence_list(
  user_id TEXT NOT NULL,
  observed_user_id TEXT NOT NULL, -- a UserID,
  accepted BOOLEAN NOT NULL
);
