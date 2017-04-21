 

mysql> select repo_commit.author_name from repo_commit where date_gmt >= '2014-08-19 00:00:00.0' and date_gmt < '2014-08-20 00:00:00.0';
+-----------------+
| author_name     |
+-----------------+
| Michael Ridgway |
| lingyan         |
| Michael Ridgway |
+-----------------+
3 rows in set (0.00 sec)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

mysql> select sum(merges_count ) from repo_commit where date_gmt >='2014-10-01' and date_gmt <'2014-11-01'
    -> ;
+--------------------+
| sum(merges_count ) |
+--------------------+
|                 12 |
+--------------------+
1 row in set (0.00 sec)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

mysql> select distinct a.author_email from repo_commit a where a.author_email like '%github.com';
+-----------------------------------+
| author_email                      |
+-----------------------------------+
| lingyan@users.noreply.github.com  |
| ben-tsai@users.noreply.github.com |
+-----------------------------------+
2 rows in set (0.00 sec)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
mysql> select a.commit_id, a.author_email, a.date_gmt from repo_commit a Where a.date_gmt >= '2014-12-01' and a.date_gmt < '2015-05-01'  and a.author_email like '%github.com';
+------------------------------------------+-----------------------------------+---------------------+
| commit_id                                | author_email                      | date_gmt            |
+------------------------------------------+-----------------------------------+---------------------+
| c282868c56e12bf8b22640ce0fcfe81aa9521e5e | lingyan@users.noreply.github.com  | 2015-04-21 22:11:32 |
| 2267c1b03b490cbb56e2082709baab5439912afa | lingyan@users.noreply.github.com  | 2015-04-21 18:34:58 |
| edd98134a6af7bbd6f7a3036ab3c97e5fe0d8637 | lingyan@users.noreply.github.com  | 2015-04-06 18:19:41 |
| 5e3f5c5d04b34f785466735c14a96b062e8a6a5a | lingyan@users.noreply.github.com  | 2015-04-06 18:17:57 |
| 79e79b7e66c42a851b11b7b00879fc415b57381a | lingyan@users.noreply.github.com  | 2015-03-30 21:22:04 |
| 7d05353626da3529a4fb14349493676f62f5f322 | lingyan@users.noreply.github.com  | 2015-03-30 21:13:06 |
| 6a3e90c33629eb87e7cbab4ad5711c94dd8b970e | lingyan@users.noreply.github.com  | 2015-03-30 17:23:10 |
| c1002f96e2dac51c89f7c0fcc9eeea76ea407d2e | lingyan@users.noreply.github.com  | 2015-03-04 05:58:01 |
| 2e9eb92eef8f1e4bd29ff2f56f14531a46a992da | lingyan@users.noreply.github.com  | 2015-02-26 23:50:16 |
| 0d0078b29056c4258c112d300700a6a5a0797328 | lingyan@users.noreply.github.com  | 2015-02-24 06:34:54 |
| 3e238f3bcbef006afa6bbeef9e612ee13858ab90 | lingyan@users.noreply.github.com  | 2015-02-18 01:10:48 |
| 2685e81e811e8bc110804996bf89630327cb12ea | lingyan@users.noreply.github.com  | 2015-02-14 08:56:36 |
| c8b50cfafb0e2df154a83941a8c75f47ba2f7ab4 | lingyan@users.noreply.github.com  | 2015-02-05 09:06:42 |
| 943a74ef32d71625f8e07bc9f8971c9e2d2a12c5 | lingyan@users.noreply.github.com  | 2015-02-05 09:00:17 |
| a534e426e00e2f34c30bdfe8c3b1b1f7bc6d0b66 | lingyan@users.noreply.github.com  | 2015-02-04 20:20:48 |
| a344aa04887aaaa2b52cee6244a5181b3c6e82a4 | lingyan@users.noreply.github.com  | 2015-02-02 23:46:17 |
| 44e3e59ab5a18babbbbcc044809a5685f45e85ca | lingyan@users.noreply.github.com  | 2015-02-02 23:43:40 |
| 9a19c2f9f5c42c2eb60345b678fc1b798abe3c4b | lingyan@users.noreply.github.com  | 2015-01-28 04:04:38 |
| fb91f88d7e42200546c47e5e768d048bc0d124fa | lingyan@users.noreply.github.com  | 2015-01-27 02:34:23 |
| a8a2f762f19f3cb740c138e8a96d8e5076c19bbc | lingyan@users.noreply.github.com  | 2015-01-27 02:33:00 |
| 657940f87996ac0f4b88bb34f5c12df1fb691546 | lingyan@users.noreply.github.com  | 2015-01-24 07:18:30 |
| 351ce186f65906331a27607aaed61c5d89c52584 | lingyan@users.noreply.github.com  | 2015-01-24 07:10:09 |
| 2827037fd4ac7ee4d6618b6466857a86ee2957c7 | lingyan@users.noreply.github.com  | 2015-01-24 03:29:02 |
| 337e618c383ebb35447459db61b07eccae2ef272 | lingyan@users.noreply.github.com  | 2015-01-13 00:34:13 |
| 4f0203ab0c41cc798f5f87c60ddc32e7f97ab0a1 | lingyan@users.noreply.github.com  | 2015-01-06 04:20:16 |
| e465ae5db0c7db76c4bc0293f108cb81f6398fdc | lingyan@users.noreply.github.com  | 2015-01-05 22:36:39 |
| ec3e73a181637b70ff54d82729965dea88c58f11 | lingyan@users.noreply.github.com  | 2014-12-16 23:17:02 |
| a4b92f3dd4536f27279f833bb2de745ae913d908 | lingyan@users.noreply.github.com  | 2014-12-16 23:13:51 |
| 421f2c28407f201a3a0e9952827f688b605a1ab8 | lingyan@users.noreply.github.com  | 2014-12-15 22:15:11 |
| e76920ffbc71df4b5fc50d1c1a26f75c7580c978 | lingyan@users.noreply.github.com  | 2014-12-11 20:29:20 |
| 88dbdf7972f697f2a9357826fc5d686b74b868c8 | lingyan@users.noreply.github.com  | 2014-12-05 07:56:02 |
| dd4bd94be5840f20661c1c554460fad415ed5d82 | lingyan@users.noreply.github.com  | 2014-12-04 21:22:23 |
| 06aa4cf5ef79f30cd0dddce16ba4f73d990cec1f | lingyan@users.noreply.github.com  | 2014-12-04 01:46:57 |
| d6f9fa7e6e3775736a79b23affd01aca4772d6b6 | ben-tsai@users.noreply.github.com | 2014-12-03 04:21:20 |
+------------------------------------------+-----------------------------------+---------------------+
34 rows in set (0.00 sec)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
mysql> Select a.author_email, count(a.author_email) from repo_commit a  group by a.author_email order by count(a.author_email)desc limit 1;
+-----------------------+-----------------------+
| author_email          | count(a.author_email) |
+-----------------------+-----------------------+
| lingyan@yahoo-inc.com |                    88 |
+-----------------------+-----------------------+
1 row in set (0.00 sec)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

mysql> Select a.author_email, count(a.author_email) from repo_commit a  group by a.author_email order by count(a.author_email)desc limit 10;
+----------------------------------+-----------------------+
| author_email                     | count(a.author_email) |
+----------------------------------+-----------------------+
| lingyan@yahoo-inc.com            |                    88 |
| lingyan@users.noreply.github.com |                    54 |
| mridgway@yahoo-inc.com           |                    22 |
| mcridgway@gmail.com              |                    20 |
| gfranko@yahoo-inc.com            |                    13 |
| seth@bertalotto.net              |                     7 |
| tbo@cybo.biz                     |                     5 |
| jedireza@yahoo-inc.com           |                     4 |
| reza@akhavan.me                  |                     2 |
| jwalton@benbria.ca               |                     1 |
+----------------------------------+-----------------------+
10 rows in set (0.01 sec)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

mysql> Select merges_count, author_name from repo_commit where merges_count > 2;
Empty set (0.00 sec)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

mysql> Select count(distinct author_name) from repo_commit where merges_count = 0;
+-----------------------------+
| count(distinct author_name) |
+-----------------------------+
|                          15 |
+-----------------------------+
1 row in set (0.00 sec)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
mysql> Select count(author_email) from repo_commit where author_email = "tbo@cybo.biz";
+---------------------+
| count(author_email) |
+---------------------+
|                   5 |
+---------------------+
1 row in set (0.00 sec)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
