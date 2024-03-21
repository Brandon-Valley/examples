  def write_ordered_tables(
        self, dest_ordered_joe_test_case_table_csv_path: Path, dest_ordered_bob_test_file_table_csv_path: Path
    ):
        dest_ordered_joe_test_case_table_csv_path.parent.mkdir(parents=True, exist_ok=True)
        dest_ordered_bob_test_file_table_csv_path.parent.mkdir(parents=True, exist_ok=True)

        result_df = self._get_query_result_data_frame(
            f"""
            SELECT * FROM joe_test_case_table
            Order By {",".join(cmn.joe_TEST_CASE_TABLE_HEADER_ORDER)}
            """
        )
        print(f"Writing {dest_ordered_joe_test_case_table_csv_path=}...")
        result_df.to_csv(dest_ordered_joe_test_case_table_csv_path, index=False)

    def get_num_test_cases(self):
        result_df = self._get_query_result_data_frame("SELECT COUNT(*) AS row_count FROM joe_test_case_table")
        # row_count = result_df['row_count'].tolist()[0]
        return result_df.at[0, "row_count"]

    def get_num_unique_requirements(self):
        result_df = self._get_query_result_data_frame(
            "SELECT COUNT(DISTINCT requirement_id) AS n FROM joe_test_case_table"
        )
        return result_df.at[0, "n"]

    def get_num_test_cases_by_test_env(self):
        result_df = self._get_query_result_data_frame(
            """
            SELECT test_environment, COUNT(*) AS test_environment_count
            FROM joe_test_case_table
            GROUP BY test_environment;
        """
        )
        d = {}
        for _index, row in result_df.iterrows():
            d[row["test_environment"]] = row["test_environment_count"]
        return d

    def get_num_test_cases(self):
        result_df = self._get_query_result_data_frame("SELECT COUNT(*) AS row_count FROM joe_test_case_table")
        return result_df.at[0, "row_count"]
