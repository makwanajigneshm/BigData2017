--1)List of Author name who logged on Aug 19 2014.
mysql> select  author_name,date_string from repo_commit where date_gmt >= '2014-08-19 00:00:00' and  date_gmt <'2014-08-20 00:00:00';
+-----------------+---------------------+
| author_name     | date_string         |
+-----------------+---------------------+
| Michael Ridgway | 2014-08-19 14:18:49 |
| lingyan         | 2014-08-19 14:12:05 |
| Michael Ridgway | 2014-08-19 13:46:48 |
+-----------------+---------------------+
3 rows in set (0.00 sec)
--2) total Number of merge counts in month Oct-2014.
mysql> select sum(merges_count) Total_Merges from  repo_commit where date_gmt >= '2014-10-01 00:00:00' and  date_gmt <'2014-11-01 00:00:00';
+--------------+
| Total_Merges |
+--------------+
|           12 |
+--------------+
1 row in set (0.00 sec)
--3) List of Autoher Email ending in github.com
mysql> select distinct author_email from repo_commit where lcase(author_email) like '%github.com';
+-----------------------------------+
| author_email                      |
+-----------------------------------+
| lingyan@users.noreply.github.com  |
| ben-tsai@users.noreply.github.com |
+-----------------------------------+
2 rows in set (0.00 sec)
--4) List of Commit, Email and Email date sent between 1 Dec 2014 and 30 Apr 2015
mysql> select commit_id , author_email , date_string from repo_commit where author_email like '%github.com' and date_string >='2014-12-01 00:00:00' and date_string <'2015-05-01 00:00:00';
+------------------------------------------+-----------------------------------+---------------------+
| commit_id                                | author_email                      | date_string         |
+------------------------------------------+-----------------------------------+---------------------+
| c282868c56e12bf8b22640ce0fcfe81aa9521e5e | lingyan@users.noreply.github.com  | 2015-04-21 13:11:32 |
| 2267c1b03b490cbb56e2082709baab5439912afa | lingyan@users.noreply.github.com  | 2015-04-21 09:34:58 |
| edd98134a6af7bbd6f7a3036ab3c97e5fe0d8637 | lingyan@users.noreply.github.com  | 2015-04-06 09:19:41 |
| 5e3f5c5d04b34f785466735c14a96b062e8a6a5a | lingyan@users.noreply.github.com  | 2015-04-06 09:17:57 |
| 79e79b7e66c42a851b11b7b00879fc415b57381a | lingyan@users.noreply.github.com  | 2015-03-30 12:22:04 |
| 7d05353626da3529a4fb14349493676f62f5f322 | lingyan@users.noreply.github.com  | 2015-03-30 12:13:06 |
| 6a3e90c33629eb87e7cbab4ad5711c94dd8b970e | lingyan@users.noreply.github.com  | 2015-03-30 08:23:10 |
| c1002f96e2dac51c89f7c0fcc9eeea76ea407d2e | lingyan@users.noreply.github.com  | 2015-03-03 20:58:01 |
| 2e9eb92eef8f1e4bd29ff2f56f14531a46a992da | lingyan@users.noreply.github.com  | 2015-02-26 14:50:16 |
| 0d0078b29056c4258c112d300700a6a5a0797328 | lingyan@users.noreply.github.com  | 2015-02-23 21:34:54 |
| 3e238f3bcbef006afa6bbeef9e612ee13858ab90 | lingyan@users.noreply.github.com  | 2015-02-17 16:10:48 |
| 2685e81e811e8bc110804996bf89630327cb12ea | lingyan@users.noreply.github.com  | 2015-02-13 23:56:36 |
| c8b50cfafb0e2df154a83941a8c75f47ba2f7ab4 | lingyan@users.noreply.github.com  | 2015-02-05 00:06:42 |
| 943a74ef32d71625f8e07bc9f8971c9e2d2a12c5 | lingyan@users.noreply.github.com  | 2015-02-05 00:00:17 |
| a534e426e00e2f34c30bdfe8c3b1b1f7bc6d0b66 | lingyan@users.noreply.github.com  | 2015-02-04 11:20:48 |
| a344aa04887aaaa2b52cee6244a5181b3c6e82a4 | lingyan@users.noreply.github.com  | 2015-02-02 14:46:17 |
| 44e3e59ab5a18babbbbcc044809a5685f45e85ca | lingyan@users.noreply.github.com  | 2015-02-02 14:43:40 |
| 9a19c2f9f5c42c2eb60345b678fc1b798abe3c4b | lingyan@users.noreply.github.com  | 2015-01-27 19:04:38 |
| fb91f88d7e42200546c47e5e768d048bc0d124fa | lingyan@users.noreply.github.com  | 2015-01-26 17:34:23 |
| a8a2f762f19f3cb740c138e8a96d8e5076c19bbc | lingyan@users.noreply.github.com  | 2015-01-26 17:33:00 |
| 657940f87996ac0f4b88bb34f5c12df1fb691546 | lingyan@users.noreply.github.com  | 2015-01-23 22:18:30 |
| 351ce186f65906331a27607aaed61c5d89c52584 | lingyan@users.noreply.github.com  | 2015-01-23 22:10:09 |
| 2827037fd4ac7ee4d6618b6466857a86ee2957c7 | lingyan@users.noreply.github.com  | 2015-01-23 18:29:02 |
| 337e618c383ebb35447459db61b07eccae2ef272 | lingyan@users.noreply.github.com  | 2015-01-12 15:34:13 |
| 4f0203ab0c41cc798f5f87c60ddc32e7f97ab0a1 | lingyan@users.noreply.github.com  | 2015-01-05 19:20:16 |
| e465ae5db0c7db76c4bc0293f108cb81f6398fdc | lingyan@users.noreply.github.com  | 2015-01-05 13:36:39 |
| ec3e73a181637b70ff54d82729965dea88c58f11 | lingyan@users.noreply.github.com  | 2014-12-16 14:17:02 |
| a4b92f3dd4536f27279f833bb2de745ae913d908 | lingyan@users.noreply.github.com  | 2014-12-16 14:13:51 |
| 421f2c28407f201a3a0e9952827f688b605a1ab8 | lingyan@users.noreply.github.com  | 2014-12-15 13:15:11 |
| e76920ffbc71df4b5fc50d1c1a26f75c7580c978 | lingyan@users.noreply.github.com  | 2014-12-11 11:29:20 |
| 88dbdf7972f697f2a9357826fc5d686b74b868c8 | lingyan@users.noreply.github.com  | 2014-12-04 22:56:02 |
| dd4bd94be5840f20661c1c554460fad415ed5d82 | lingyan@users.noreply.github.com  | 2014-12-04 12:22:23 |
| 06aa4cf5ef79f30cd0dddce16ba4f73d990cec1f | lingyan@users.noreply.github.com  | 2014-12-03 16:46:57 |
| d6f9fa7e6e3775736a79b23affd01aca4772d6b6 | ben-tsai@users.noreply.github.com | 2014-12-03 11:21:20 |
+------------------------------------------+-----------------------------------+---------------------+
34 rows in set (0.00 sec)

--5) Which Author Email sends maximum time.
mysql> select count(commit_id), author_email from repo_commit group by  author_email order by count(commit_id ) desc limit 1;
+------------------+-----------------------+
| count(commit_id) | author_email          |
+------------------+-----------------------+
|               88 | lingyan@yahoo-inc.com |
+------------------+-----------------------+
1 row in set (0.00 sec)
--6) Top Ten Email Senders
mysql> select count(commit_id), author_email from repo_commit group by  author_email order by count(commit_id ) desc limit 10;
+------------------+----------------------------------+
| count(commit_id) | author_email                     |
+------------------+----------------------------------+
|               88 | lingyan@yahoo-inc.com            |
|               54 | lingyan@users.noreply.github.com |
|               22 | mridgway@yahoo-inc.com           |
|               20 | mcridgway@gmail.com              |
|               13 | gfranko@yahoo-inc.com            |
|                7 | seth@bertalotto.net              |
|                5 | tbo@cybo.biz                     |
|                4 | jedireza@yahoo-inc.com           |
|                2 | reza@akhavan.me                  |
|                1 | jwalton@benbria.ca               |
+------------------+----------------------------------+
10 rows in set (0.00 sec)
--6) Any Author merge count > 2, None.
mysql> select author_name from repo_commit where merges_count >2;
Empty set (0.00 sec)
--7) Count author name where merge count is 0
mysql> select count(distinct author_name) from repo_commit where merges_count =0;
+-----------------------------+
| count(distinct author_name) |
+-----------------------------+
|                          15 |
+-----------------------------+
1 row in set (0.00 sec)
--8) count total number of times tbo@cybo.biz email
mysql> select count(1) from repo_commit where author_email ='tbo@cybo.biz';
+----------+
| count(1) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)
